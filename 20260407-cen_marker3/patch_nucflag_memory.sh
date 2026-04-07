#!/bin/bash
# Patch for NucFlag memory leak issue
# Reference: https://github.com/logsdon-lab/NucFlag/issues/52

set -eu

NUCFLAG_DIR="${1:-venv/lib/python3.12/site-packages/nucflag}"
TARGET_FILE="$NUCFLAG_DIR/classifier/classifier.py"

if [[ ! -f "$TARGET_FILE" ]]; then
    echo "Error: $TARGET_FILE not found" >&2
    exit 1
fi

# Check if already patched
if grep -q "aln.close()" "$TARGET_FILE"; then
    echo "Already patched: aln.close() found"
    exit 0
fi

# Patch 1: Add aln.close() after del cov_first_second (line 245)
sed -i 's/del cov_first_second$/del cov_first_second\n        aln.close()/' "$TARGET_FILE"

# Patch 2: Capture figure from plot_coverage and close it after savefig
sed -i 's/_ = plot_coverage(/fig, _ = plot_coverage(/' "$TARGET_FILE"
sed -i '/plt.savefig(output_plot, dpi=PLOT_DPI, bbox_inches="tight")/a\        plt.close(fig)' "$TARGET_FILE"

echo "Patched: $TARGET_FILE"

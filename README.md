# ncov-watch-nf

## Summary
This pipeline is used to run the `ncov-watch.py` script from [jts/ncov-random-scripts](https://github.com/jts/ncov-random-scripts) to
detect SARS-CoV-2 'variants of concern'.

After running `ncov-watch.py`, a summary is generated to enumerate how many of the mutations from each variant were observed in each sample.

## Usage
```
nextflow run main.nf --variants_dir <path_to_root_directory_containing_variants.tsv_files> --watchlists watchlists.csv --outdir output
```

The `watchlists.csv` file is a two-column `.csv` format file containing an identifier for the variant of concern and a path to the `.vcf` file that defines that variant.

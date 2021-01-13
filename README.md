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

## Example Output

Output is in `.tsv` format.

| sample_id | variant_id    | num_observed_substitutions | total_substitutions_for_variant | proportion_observed |
|-----------|---------------|----------------------------|---------------------------------|---------------------|
| SAMPLE_01 | VOC-202012/01 |                         19 |                              20 |               0.950 |
| SAMPLE_02 | VOC-202012/01 |                          1 |                              20 |               0.050 |
| SAMPLE_01 | N501Y.V2      |                          3 |                              17 |               0.176 |
| SAMPLE_02 | N501Y.V2      |                          1 |                              17 |               0.059 |

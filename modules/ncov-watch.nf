process ncovWatch {

    publishDir "${params.outdir}/${task.process.replaceAll(":","_")}", pattern: "variants.tsv", mode: 'copy'

    input:
      tuple path(variants_dir_root), val(variant_id), path(watchlist)

    output:
      tuple val(variant_id), path(watchlist), path("variants.tsv")

    script:
      """
      find ${variants_dir_root}/ -name "*.variants.tsv" | ncov-watch.py --watchlist ${watchlist} > variants.tsv 2> /dev/null
      """
}
process ncovWatchSummary {

    publishDir "${params.outdir}/${task.process.replaceAll(":","_")}", pattern: "${variant_id}_summary.tsv", mode: 'copy'

    input:
      tuple val(variant_id), path(watchlist), path(ncov_watch_output)

    output:
      path("${variant_id}_summary.tsv")

    script:
      """
      ncov-watch-summary.py ${ncov_watch_output} --variant-id "${variant_id}" --watchlist ${watchlist} > ${variant_id}_summary.tsv
      """
}

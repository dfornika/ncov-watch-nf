#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { ncovWatch } from './modules/ncov-watch.nf'
include { ncovWatchSummary } from './modules/ncov-watch-summary.nf'

workflow {
  Channel.fromPath( params.variants_dir ).set{ ch_variants_dir }
  Channel.fromPath( params.watchlists ).splitCsv().set{ ch_watchlists }
  
  main:
    ch_variants_dir.combine(ch_watchlists)
    ncovWatch(ch_variants_dir.combine(ch_watchlists))
    ncovWatchSummary(ncovWatch.out)
}
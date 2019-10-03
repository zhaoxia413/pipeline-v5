#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

hints:
  DockerRequirement:
    dockerPull: kegg_analysis:latest

baseCommand: [give_pathways.py]
arguments: ['-o', '/']

inputs:
  input_table:
    type: File
    inputBinding:
      separate: true
      prefix: -i
  graphs:
    type: File
    inputBinding:
      prefix: -g
  pathways_names:
    type: File
    inputBinding:
      prefix: -n
  pathways_classes:
    type: File
    inputBinding:
      prefix: -c

stdout: stdout.txt

outputs:
  output_pathways_summary:
    type: File
    outputBinding:
      glob: summary_pathways.txt

  output_pathways_matching:
    type: File
    outputBinding:
      glob: matching_ko_pathways.txt

  output_pathways_missing:
    type: File
    outputBinding:
      glob: missing_ko_pathways.txt

  stdout: stdout

  out_folder:
    type: Directory
    outputBinding:
      glob: "Contigs"
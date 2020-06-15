#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

label: "antiSMASH"
doc: |
  antiSMASH allows the rapid genome-wide identification, annotation and analysis
  of secondary metabolite biosynthesis gene clusters in bacterial and fungal genomes.
  It integrates and cross-links with a large number of in silico secondary metabolite analysis tools


requirements:
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.input_fasta)
        entryname: $(inputs.input_fasta.basename).fasta
  InlineJavascriptRequirement: {}
  ResourceRequirement:
    coresMax: 4
    ramMin: 40000

hints:
  DockerRequirement:
    dockerPull: 'alpine:3.7'

inputs:

  outdirname:
    type: string
    inputBinding:
      prefix: -o

  input_fasta:
    format: edam:format_1929  # FASTA
    type: File
    inputBinding:
      prefix: -i

baseCommand: [ run_antismash_short.sh ]

stdout: stdout.txt
stderr: stderr.txt

outputs:

  geneclusters_js:
    type: File
    outputBinding:
      glob: $(inputs.outdirname)/geneclusters.js

  geneclusters_txt:
    type: File
    outputBinding:
      glob: $(inputs.outdirname)/geneclusters.txt

  embl_file:
    type: File
    outputBinding:
      glob: $(inputs.outdirname)/*final.embl

  gbk_file:
    type: File
    outputBinding:
      glob: $(inputs.outdirname)/*final.gbk

$namespaces:
 edam: http://edamontology.org/
 s: http://schema.org/
$schemas:
 - http://edamontology.org/EDAM_1.20.owl
 - https://schema.org/version/latest/schema.rdf

's:author': 'Ekaterina Sakharova'
's:copyrightHolder': EMBL - European Bioinformatics Institute
's:license': "https://www.apache.org/licenses/LICENSE-2.0"
#!/usr/bin/env
cwlVersion: v1.0
class: CommandLineTool

requirements:
  InlineJavascriptRequirement: {}
  ResourceRequirement:
    coresMin: 16
    ramMin: 200

inputs:
  input_file:
    type: File[]
    inputBinding:
      position: 1
      prefix: '-i'
  outputname:
    type: string
    inputBinding:
      position: 2
      prefix: '-o'

baseCommand: [ generate_checksum.py ]

outputs:
  hashsum:
    type: File
    outputBinding:
      glob: $(inputs.outputname)

hints:
  - class: DockerRequirement
    dockerPull: alpine:3.7

s:license: "https://www.apache.org/licenses/LICENSE-2.0"
s:copyrightHolder: "EMBL - European Bioinformatics Institute"
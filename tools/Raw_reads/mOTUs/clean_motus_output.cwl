#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

requirements:
  ShellCommandRequirement: {}
  ResourceRequirement:
    coresMax: 1
    ramMin: 200

label: "remove empty rows and reformat motus"

inputs:
  taxonomy:
    type: File
    label: motus classification
    inputBinding:
        position: 1

baseCommand: [clean_motus_output.sh]

outputs:
  clean_annotations:
    type: File
    outputBinding:
        glob: "*.tsv"

hints:
  - class: DockerRequirement
    dockerPull: 'alpine:3.7'

#$namespaces:
  #edam:http://edamontology.org/
#$schemas:

#'s:author': ''
#'s:copyrightHolder': EMBL - European Bioinformatics Institute
#'s:license': ''
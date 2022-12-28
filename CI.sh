#!/bin/bash
path="${1:-.}"
mkdir kustomize
# Main loop
# Finding all the kustomization.y*ml in the directory and iterate between them
while read -r kustomization; do
  dir="$(dirname "$kustomization")"
  IFS='/' read -r -a array <<< "$dir".
  echo "Generating kustomize file: $kustomization"
  set +e
  kubectl kustomize $dir >> "./kustomize/${array[1]}-${array[2]}.yaml" # Create yaml from kustomize file
done <<(find "$path" -type f -name '*\kustomization.y*ml')

cd ./kustomize
$HOME/.spectral/spectral scan -f --nosend # Run spectral on the convered yaml files.
exitcode=$?

if [ "$exitcode" = 0 ]; then
  echo "Success"

else
  echo "Violations found, returning exit code $exitcode"
fi
exit "$exitcode"

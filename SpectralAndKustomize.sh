kubectl kustomize <path to kustomization.yaml> >> <path to output.yaml> 
#OR
kustomize build <path to kustomization.yaml> >> <path to output.yaml> 
cd <path to output.yaml>
$HOME/.spectral/spectral scan --nosend

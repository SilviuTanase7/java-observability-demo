{{- define "oopapp.name" -}}
oopapp
{{- end -}}

{{- define "oopapp.fullname" -}}
{{ include "oopapp.name" . }}
{{- end -}}

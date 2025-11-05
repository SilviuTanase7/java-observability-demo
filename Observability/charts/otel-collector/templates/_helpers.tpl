{{/*
Return the chart name.
*/}}
{{- define "otel-collector.name" -}}
{{ .Chart.Name }}
{{- end -}}

{{/*
Create a fully qualified name for resources.
*/}}
{{- define "otel-collector.fullname" -}}
{{ include "otel-collector.name" . }}-{{ .Release.Name }}
{{- end -}}

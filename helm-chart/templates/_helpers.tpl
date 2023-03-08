{{- define "common_labels" }}
app: {{ .Values.app }}
environment: {{ .Values.environment }}
deployment: {{ .Values.deployment }}
{{- end }}

{{- define "affinity_requirements" }}
{{- if gt (len .Values.nodeAffinityRequirements) 0 }}
affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
        - matchExpressions:
          {{- range .Values.nodeAffinityRequirements }}
          - key: {{.label}}
            operator: In
            values:
              - {{.value}}
          {{- end }}
{{- end }}
{{- end }}
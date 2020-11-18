{{/* Used to put the right TLD on the P1 URLs based on the Region */}}
{{- define "sampleCiam.pingOneTld" -}}
    {{ if .Values.pingOne.usePingOneServices }}
        {{- if eq ( default "NA" .Values.pingOne.envRegion ) "EU" }}
            {{- print "eu" }}
        {{- else if eq ( default "NA" .Values.pingOne.envRegion ) "AP" }}
            {{- print "asia" }}
        {{- else }}
            {{- print "com" }}
        {{- end}}
    {{- end }}
{{- end }}

{{/* Used to put the right TLD on the P1 URLs based on the Region */}}
{{- define "sampleCiam.pingOneRegion" -}}
    {{ if .Values.pingOne.usePingOneServices }}
        {{- if eq ( default "NA" .Values.pingOne.envRegion ) "EU" }}
            {{- print "eu" }}
        {{- else if eq ( default "NA" .Values.pingOne.envRegion ) "AP" }}
            {{- print "asia" }}
        {{- else }}
            {{- print "na" }}
        {{- end}}
    {{- end }}
{{- end }}

{{/* Used to create the Admin Console Client URLs used in Software */}}
{{- define "sampleCiam.pingOneAdminUrl" }}
    {{- print "https://auth.pingone." }}{{ include "sampleCiam.pingOneTld" . }}{{ print "/" .Values.pingOne.adminConsole.envId "/as" }}
{{- end }}

{{/* Used to build the additional URLs passed into the job/pingconfig */}}
{{- define "sampleCiam.useCaseUrls" -}}
    {{- $useCaseGlobal :=  .Values.useCases }}
    {{- $useCaseDetails := .Values.collections.useCases }}
    {{- $merged := merge $useCaseDetails $useCaseGlobal }}
    {{- printf .Values.collections.solutions.sampleCiam.url }},
    {{- range $key, $val := $merged }}
        {{- if $val.enabled }}
            {{- printf $val.url }}, 
        {{- end }}
    {{- end }}
{{- end }}

{{/* Used to build the of the collections URLs passed into the job/pingconfig */}}
{{- define "sampleCiam.useCaseNames" -}}
    {{- $useCaseGlobal :=  .Values.useCases }}
    {{- $useCaseDetails := .Values.collections.useCases }}
    {{- $merged := merge $useCaseDetails $useCaseGlobal }}
    {{- printf .Values.collections.solutions.sampleCiam.name }}{{- print " --> "}}  
    {{- range $key, $val := $merged }}
        {{- if $val.enabled }}
            {{- printf $val.name }}{{ printf " : " }}  
        {{- end }}
    {{- end }}
{{- end }}

{{/* Helper for the Ingress Hostname */}}
{{- define "sampleCiam.hostname" -}}
    {{- if .Values.global.clientConnection.externalDNS.enabled }}
        {{- .Values.global.clientConnection.externalDNS.externalHostname }}
    {{- else }}
        {{- .Release.Name }}{{- print }}.ping-devops.com
    {{- end }}
{{- end }}
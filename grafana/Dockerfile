FROM grafana/grafana:latest

######
#
# Added by Diego Madiedo - Samana Group - 20-Jun2025
# Added sections to customize the graphical configuration of the Grafana component of SAMMv2
#
######
# Switch to root user for system-level operations
USER root

# Copy provisioning files with proper ownership
# COPY --chown=grafana:root provisioning/ ${GF_PATHS_PROVISIONING}/
##################################################################
# VISUAL CUSTOMIZATION - Replace branding assets
##################################################################
COPY --chown=grafana:root /img/fav32_dark.png /usr/share/grafana/public/img/fav32.png
COPY --chown=grafana:root /img/apple-touch-icon_dark.png /usr/share/grafana/public/img/apple-touch-icon.png
COPY --chown=grafana:root /img/grafana_icon_dark.svg /usr/share/grafana/public/img/grafana_icon.svg
# In case we want to change the login background
# COPY --chown=grafana:root ../config/grafana/img/background.svg /usr/share/grafana/public/img/g8_login_dark.svg
# COPY --chown=grafana:root ../config/grafana/img/background.svg /usr/share/grafana/public/img/g8_login_light.svg

##################################################################
# HTML & JS CUSTOMIZATION - Update titles, menus, and branding
##################################################################
# Update title and loading text in index.html
RUN sed -i 's|<title>\[\[.AppTitle\]\]</title>|<title>SAMM - Samana Group</title>|g' /usr/share/grafana/public/views/index.html && \
    sed -i 's|Loading Grafana|Loading SAMM|g' /usr/share/grafana/public/views/index.html
	
	# Update JavaScript files for branding and feature toggles
RUN find /usr/share/grafana/public/build/ -name "*.js" -type f \
    -exec sed -i 's|AppTitle="Grafana"|AppTitle="SAMM - Samana Group"|g' {} \; \
    -exec sed -i 's|LoginTitle="Welcome to Grafana"|LoginTitle="Welcome to SAMM"|g' {} \; \
    -exec sed -i 's|\[{target:"_blank",id:"documentation".*grafana_footer"}\]|\[\]|g' {} \; \
    -exec sed -i 's|({target:"_blank",id:"license",.*licenseUrl})|()|g' {} \; \
    -exec sed -i 's|({target:"_blank",id:"version",text:..versionString,url:.?"https://github.com/grafana/grafana/blob/main/CHANGELOG.md":void 0})|()|g' {} \; \
    -exec sed -i 's|(0,t.jsx)(d.I,{tooltip:(0,b.t)("dashboard.toolbar.switch-old-dashboard","Switch to old dashboard page"),icon:"apps",onClick:()=>{s.Ny.partial({scenes:!1})}},"view-in-old-dashboard-button")|null|g' {} \; \
    -exec sed -i 's|.push({target:"_blank",id:"version",text:`${..edition}${.}`,url:..licenseUrl,icon:"external-link-alt"})||g' {} \;
# Update feature toggles in configuration
RUN sed -i 's|\[feature_toggles\]|\[feature_toggles\]\npinNavItems = false\nonPremToCloudMigrations = false\ncorrelations = false|g' /usr/share/grafana/conf/defaults.ini

##################################################################
# CLEANUP - Remove unused data sources and panels
##################################################################
# Remove non-used data sources
RUN rm -rf \
    /usr/share/grafana/public/app/plugins/datasource/elasticsearch \
    /usr/share/grafana/public/build/elasticsearch* \
    /usr/share/grafana/public/app/plugins/datasource/graphite \
    /usr/share/grafana/public/build/graphite* \
    /usr/share/grafana/public/app/plugins/datasource/opentsdb \
    /usr/share/grafana/public/build/opentsdb* \
    /usr/share/grafana/public/app/plugins/datasource/influxdb \
    /usr/share/grafana/public/build/influxdb* \
    /usr/share/grafana/public/app/plugins/datasource/tempo \
    /usr/share/grafana/public/build/tempo* \
    /usr/share/grafana/public/app/plugins/datasource/jaeger \
    /usr/share/grafana/public/build/jaeger* \
    /usr/share/grafana/public/app/plugins/datasource/zipkin \
    /usr/share/grafana/public/build/zipkin* \
    /usr/share/grafana/public/app/plugins/datasource/cloudwatch \
    /usr/share/grafana/public/build/cloudwatch* \
    /usr/share/grafana/public/app/plugins/datasource/cloud-monitoring \
    /usr/share/grafana/public/build/cloudMonitoring* \
    /usr/share/grafana/public/app/plugins/datasource/parca \
    /usr/share/grafana/public/build/parca* \
    /usr/share/grafana/public/app/plugins/datasource/phlare \
    /usr/share/grafana/public/build/phlare* \
    /usr/share/grafana/public/app/plugins/datasource/grafana-pyroscope-datasource \
    /usr/share/grafana/public/build/pyroscope*

# Remove Cloud and Enterprise categories from JS files
RUN find /usr/share/grafana/public/build/ -name "*.js" -type f \
    -exec sed -i 's|.id==="enterprise"|.id==="notanenterprise"|g' {} \; \
    -exec sed -i 's|.id==="cloud"|.id==="notacloud"|g' {} \;
######
#
# Finish changes added by Diego Madiedo - Samana Group - 20-Jun2025
# Added sections to customize the graphical configuration of the Grafana component of SAMMv2
#
######

USER grafana

# Healthcheck to ensure Grafana is running
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:3000/api/health || exit 1


RUN grafana cli plugins install yesoreyeram-infinity-datasource
RUN grafana cli plugins install gapit-htmlgraphics-panel


# Expose Grafana default port
EXPOSE 3000

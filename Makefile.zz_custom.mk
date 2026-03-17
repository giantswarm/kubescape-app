##@ Custom

# Override update-chart to restore dependency_chart/Chart.yaml after vendir sync.
# upstream doesn't have a Chart.yaml from dependency_chart,
# but helm dependency update requires it to treat the directory as a chart.
update-chart: check-env ## Sync chart with upstream repo.
	@echo "====> $@"
	vendir sync
	@if [ ! -f $(APPLICATION)/charts/dependency_chart/Chart.yaml ]; then \
		echo "Restoring missing dependency_chart/Chart.yaml"; \
		printf 'apiVersion: v2\nname: dependency_chart\nversion: 0.0.0\nannotations:\n  application.giantswarm.io/team: shield\n' \
			> $(APPLICATION)/charts/dependency_chart/Chart.yaml; \
	fi
	$(MAKE) update-deps APPLICATION=$(APPLICATION)

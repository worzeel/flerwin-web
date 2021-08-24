.PHONY: all
all:
	@echo "Building backend..."
	@cd back && ${MAKE}

	@echo "Building frontend..."
	@cd front && ${MAKE}

.PHONY: clean
clean:
	@echo "clean backend..."
	@cd back && ${MAKE} clean

	@echo "clean frontend..."
	@cd front && ${MAKE} clean
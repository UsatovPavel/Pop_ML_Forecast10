.PHONY: clean setup install help

setup: clean
	@echo "Создание нового виртуального окружения..."
	$(PYTHON) -m venv $(VENV)
	@echo "Установка зависимостей..."
	$(BIN)/pip install --upgrade pip
	$(BIN)/pip install -r requirements.txt
	@echo "Виртуальное окружение создано и зависимости установлены."
install:
	@if [ ! -d "$(VENV)" ]; then \
		echo "Виртуальное окружение не найдено. Выполните 'make setup' сначала."; \
		exit 1; \
	fi
	@echo "Установка зависимостей..."
	$(BIN)/pip install --upgrade pip
	$(BIN)/pip install -r requirements.txt
	@echo "Зависимости установлены."

prepare_data:
	jupyter nbconvert --execute 2.1.collect_cohort_data.ipynb 2.2.collect_more_wb_data.ipynb 2.3.convert_matrix.ipynb


# Python версия
PYTHON := python3
VENV := .venv
BIN := $(VENV)/bin

help:
	@echo "Доступные команды:"
	@echo "  make clean    - Удаляет виртуальное окружение"
	@echo "  make setup    - Создает новое виртуальное окружение и устанавливает зависимости"
	@echo "  make install  - Устанавливает зависимости в существующее окружение"

clean:
	@echo "Удаление виртуального окружения..."
	rm -rf $(VENV)
	@echo "Виртуальное окружение удалено."

FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY poetry.lock pyproject.toml /app/

RUN pip install poetry

RUN poetry install

COPY . /app/

CMD ["poetry", "run", "python", "manage.py", "runserver", "0.0.0.0:8000"]

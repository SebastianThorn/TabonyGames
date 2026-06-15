# Set baseimage
FROM alpine:3.24

# Install python
RUN apk add --no-cache python3 py3-pip

# Install python-environment and activate it
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN . /opt/venv/bin/activate

# Install requirements
COPY requirements.txt /tmp/.
RUN pip install -r /tmp/requirements.txt --no-cache-dir

# Copy secrets
COPY defaults/secrets.ini /.

# Copy source
COPY src/ /app/.

# Set working directory
WORKDIR /app

# Set up environment
ENV REGION=us-west
ENV DJANGO_SECRET_KEY=56^efa0z42ow0-xxiz08c%d4=8k=^9#34c^xj&p&u-8!fon+=1
ENV DJANGO_LOCAL_RUN=TRUE
ENV DJANGO_SECRET_PATH=/secrets.ini

# Run the game
CMD ["python", "manage.py"]

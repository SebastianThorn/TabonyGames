# Set baseimage
FROM alpine:3.24

# Install python
RUN apk add --no-cache python3 py3-pip sqlite

# Install python-environment and activate it
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN . /opt/venv/bin/activate

# Set working directory
WORKDIR /app

# Install requirements
COPY requirements.txt /tmp/.
RUN pip install -r /tmp/requirements.txt --no-cache-dir

# Copy secrets
COPY defaults/secrets.ini /.

# Copy source
COPY Games/ /app/Games/.
COPY Nations/ /app/Nations/.
COPY templates/ /app/templates/.
COPY users/ /app/users/.
COPY manage.py /app/.

# Copy static files and unpack
COPY TGstatic.tar.gz /app/.
RUN tar xvf TGstatic.tar.gz


# Set up environment
ENV REGION=us-west
ENV DJANGO_SECRET_KEY=56^efa0z42ow0-xxiz08c%d4=8k=^9#34c^xj&p&u-8!fon+=1
ENV DJANGO_LOCAL_RUN=TRUE
ENV DJANGO_SECRET_PATH=/secrets.ini

# RUN python manage.py migrate
# RUN python manage.py createsuperuser

# Run the game
#CMD ["python", "manage.py"]
CMD ["daphne", "-b", "0.0.0.0", "users.asgi:application"]

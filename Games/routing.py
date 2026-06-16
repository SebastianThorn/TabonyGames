from django.urls import re_path

from . import consumers
import src.Nations.consumers

websocket_urlpatterns = [
    re_path(r'ws/$', consumers.GamesConsumer.as_asgi()),
    re_path(r'ws/nations/$', src.Nations.consumers.NationsConsumer.as_asgi()),
    re_path(r'ws/nations/(?P<match_id>\d+)/$', src.Nations.consumers.NationsMatchConsumer.as_asgi()),
]

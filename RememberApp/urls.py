from django.contrib import admin
from django.urls import path, include, re_path
from django.conf import settings
from django.views.static import serve

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include(('Apps.Principal.urls', 'principal'))),
    path('login/', include(('Apps.Autenticacion.urls', 'login'))),
    path('', include(('Apps.Blog.urls', 'blog'))),
    path('', include(('Apps.Cuidadores.urls', 'cuidadores'))),
]

if settings.DEBUG:
    urlpatterns += [
        re_path(r'^media/(?P<path>.*)$', serve , {
            'document_root':settings.MEDIA_ROOT,
        }),
    ]

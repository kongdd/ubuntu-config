import os


def set_proxy(proxy="http://127.0.0.1:1080"):
    os.environ['http_proxy'] = proxy
    os.environ['https_proxy'] = proxy

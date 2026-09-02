from mitmproxy import http

def request(flow: http.HTTPFlow):
    # change the user agent header
    flow.request.headers["User-Agent"] = "Widoco"
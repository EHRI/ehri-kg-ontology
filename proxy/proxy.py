from mitmproxy import http
import pathlib

LOCAL = {
    "/standards/RiC/ontology/1.0.2": "configurations/imports/RiC-O_1-0-2.rdf",
    "/standards/RiC/ontology/1.1": "configurations/imports/RiC-O_1-1.rdf"
}

def request(flow: http.HTTPFlow):
    # change the user agent header
    flow.request.headers["User-Agent"] = "Widoco"
    # serving RiC-O versions locally to avoid blocks
    if flow.request.pretty_host.endswith("ica.org") and flow.request.path in LOCAL:
        body = pathlib.Path(LOCAL[flow.request.path]).read_bytes()
        flow.response = http.Response.make(
            200, body, {"Content-Type": "application/rdf+xml"}
        )
    
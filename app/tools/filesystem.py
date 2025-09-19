# app/tools/filesystem.py
import os, subprocess
from pathlib import Path

ROOT = Path(os.environ.get("WORKSPACE_ROOT", ".")).resolve()

def _safe(p: str) -> Path:
    p = (ROOT / p).resolve()
    if not str(p).startswith(str(ROOT)):
        raise ValueError("Path escapes workspace")
    return p

def list_dir(path="."):
    p = _safe(path)
    return "\n".join(sorted([x.name + ("/" if x.is_dir() else "") for x in p.iterdir()]))

def read_file(path, max_bytes=200_000):
    with open(_safe(path), "r", encoding="utf-8") as f:
        return f.read()[:max_bytes]

def write_file(path, content, overwrite=True):
    p = _safe(path); p.parent.mkdir(parents=True, exist_ok=True)
    if p.exists() and not overwrite:
        return f"Refuse overwrite: {path}"
    p.write_text(content, encoding="utf-8")
    return f"Wrote {len(content)} bytes to {path}"

def run_cmd(cmd, timeout=120):
    # белый список команд — поправь под свой стек
    allow = ("npm","pnpm","yarn","node","python","uv","pytest","ruff","black","prettier","git","pip")
    if cmd.split()[0] not in [a.split()[0] for a in allow]:
        return "Command not allowed"
    p = subprocess.run(cmd, cwd=str(ROOT), shell=True, capture_output=True, text=True, timeout=timeout)
    return (p.stdout or "") + (p.stderr or "")

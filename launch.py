# this scripts installs necessary requirements and launches main program in webui.py
import subprocess
import os
import sys
import importlib.util
import shlex
import platform

python = sys.executable
git = os.environ.get('GIT', "git")


def extract_arg(args, name):
    return [x for x in args if x != name], name in args


def run(command, desc=None, errdesc=None, custom_env=None):
    if desc is not None:
        print(desc)

    result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True, env=os.environ if custom_env is None else custom_env)

    if result.returncode != 0:

        message = f"""{errdesc or 'Error running command'}.
Command: {command}
Error code: {result.returncode}
stdout: {result.stdout.decode(encoding="utf8", errors="ignore") if len(result.stdout)>0 else '<empty>'}
stderr: {result.stderr.decode(encoding="utf8", errors="ignore") if len(result.stderr)>0 else '<empty>'}
"""
        raise RuntimeError(message)

    return result.stdout.decode(encoding="utf8", errors="ignore")


def run_python(code, desc=None, errdesc=None):
    return run(f'"{python}" -c "{code}"', desc, errdesc)


def prepare_enviroment():
    commandline_args = os.environ.get('COMMANDLINE_ARGS', "")
    sys.argv += shlex.split(commandline_args)

    sys.argv, skip_torch_cuda_test = extract_arg(sys.argv, '--skip-torch-cuda-test')

    try:
        commit = run(f"{git} rev-parse HEAD").strip()
    except Exception:
        commit = "<none>"

    print(f"Python {sys.version}")
    print(f"Commit hash: {commit}")

    if not skip_torch_cuda_test:
        run_python("import torch; assert torch.cuda.is_available(), 'Torch is not able to use GPU; add --skip-torch-cuda-test to COMMANDLINE_ARGS variable to disable this check'")



def start():
    print(f"Launching {'API server' if '--nowebui' in sys.argv else 'Web UI'} with arguments: {' '.join(sys.argv[1:])}")
    import webui
    if '--nowebui' in sys.argv:
        webui.api_only()
    else:
        webui.webui()


if __name__ == "__main__":
    prepare_enviroment()
    start()
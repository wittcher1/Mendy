#!/usr/bin/env python3
import subprocess

class MendyAPI:
    @staticmethod
    def processar_comando(cmd: str):
        try:
            proc = subprocess.run(cmd, shell=True, capture_output=True, text=True)
            if proc.returncode != 0:
                return False, proc.stderr.strip()
            return True, proc.stdout.strip()
        except Exception as e:
            return False, str(e)

def main():
    print("🖥️  Mendy-Term pronta! (digite 'exit' para sair)")
    while True:
        cmd = input("$ ").strip()
        if cmd.lower() in ("exit", "quit", "sair"):
            print("👋 Desligando Mendy-Term...")
            break
        success, out = MendyAPI.processar_comando(cmd)
        print(out if success else f"[Erro] {out}")

if __name__ == "__main__":
    main()

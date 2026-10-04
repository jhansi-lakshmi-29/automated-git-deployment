from flask import Flask, request
import subprocess

app = Flask(__name__)


@app.route("/")
def home():
    return "Webhook server is running!"


@app.route("/webhook", methods=["POST"])
def webhook():
    print("Webhook received from GitHub!")

    subprocess.Popen(
        ["cmd", "/c", "deployment\\deploy.bat"],
        creationflags=subprocess.CREATE_NEW_CONSOLE
    )

    return "Deployment triggered successfully!", 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
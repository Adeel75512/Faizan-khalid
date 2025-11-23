# Use Latest LTS Node
FROM node:lts-buster

# Install git
RUN apt-get update && apt-get install -y git

# Clone your bot
RUN git clone https://github.com/Adeel-Xtech/ADEEL-MD.git /root/adeel-bot

# Set working directory to the cloned folder
WORKDIR /root/adeel-bot

# Install dependencies
RUN npm install --legacy-peer-deps || true
RUN npm install -g pm2

# Expose correct port for Render & Heroku
EXPOSE 3000
ENV PORT=3000

# Start the bot
CMD ["npm", "start"]

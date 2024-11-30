FROM node:12.22-alpine

RUN apk add --no-cache openssh \
    && ssh-keygen -A \
    && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
    && echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config \
    && echo "ChallengeResponseAuthentication no" >> /etc/ssh/sshd_config \
    && echo 'root:senha' | chpasswd

# Exponha a porta do SSH
EXPOSE 22

# Inicie o serviço SSH
CMD ["/usr/sbin/sshd", "-D"]
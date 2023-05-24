FROM registry.fedoraproject.org/fedora-minimal

ENV SYSTEMD_IGNORE_CHROOT=1

RUN microdnf -y --setopt=tsflags=nodocs upgrade \
    && microdnf -y --setopt=tsflags=nodocs install open-vm-tools \ 
    && microdnf clean all

CMD ["/usr/bin/vmtoolsd"]
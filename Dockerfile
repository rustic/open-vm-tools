FROM registry.fedoraproject.org/fedora-minimal

ENV SYSTEMD_IGNORE_CHROOT=1

RUN microdnf -y --setopt=tsflags=nodocs open-vm-tools && \ 
    microdnf clean all

CMD ["/usr/bin/vmtoolsd"]
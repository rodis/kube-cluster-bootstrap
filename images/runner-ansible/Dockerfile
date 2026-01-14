FROM public.ecr.aws/spacelift/runner-ansible

# Temporarily elevating permissions
USER root
WORKDIR /home/spacelift

RUN apk -U upgrade && apk add kubectl helm kustomize && \
  pip install openstacksdk netaddr jsonschema kubernetes --break-system-packages


# Back to the restricted "spacelift" user
USER spacelift
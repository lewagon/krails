require "anyway_config"

class KrailsConfig < Anyway::Config
  DOCR_URL = "registry.digitalocean.com"

  attr_config(
    :debug,
    :ruby_version,
    :pg_major_version,
    :node_major_version,
    :yarn_version,
    :bundler_version,
    :app_name,
    :production_image_name,
    :docker_registry,
    :docker_username,
    :docker_password,
    :docker_repository,
    :do_cluster_name,
    :hostname,
    :certificate_email,
    use_sidekiq: true,
    use_webpacker: true,
    release_namespace: "default",
    helm_timeout: "3m0s",
    required_secrets: [],
    secrets: {},
    with_apt_packages: []
  )

  def uses_docr?
    docker_registry == DOCR_URL
  end

  def app_name
    super # TODO: (call from outside) || Rails.root.to_s.split("/").last
  end
end

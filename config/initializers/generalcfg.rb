GENERAL_CONFIG_PATH = "#{Rails.root.to_s}/config/initializers/"
GENERALCFG = YAML.load_file(GENERAL_CONFIG_PATH + 'generalcfg.yml')['default']

return {
  -- Have to add this for yamlls to understand that we support line folding
  capabilities = {
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      },
    },
  },

  -- lazy-load schemastore when needed
  on_new_config = function(new_config)
    new_config.settings.yaml.schemas = vim.tbl_deep_extend('force', new_config.settings.yaml.schemas or {}, require('schemastore').yaml.schemas())
  end,

  -- detect k8s schemas based on file content
  builtin_matchers = {
    kubernetes = { enabled = true },
  },

  settings = {
    redhat = { telemetry = { enabled = false } },
    yaml = {
      keyOrdering = false,
      format = {
        enable = true,
      },
      validate = true,
      schemaStore = {
        enable = false,
        url = '',
      },

      -- schemas from store, matched by filename
      -- loaded automatically
      schemas = require('schemastore').yaml.schemas {
        select = {
          -- k8s related
          'kustomization.yaml',
          -- github
          'GitHub Workflow',
          -- gitlab
          'gitlab-ci',
          -- ansible related
          'Ansible Execution Environment',
          'Ansible Inventory',
          'Ansible Navigator Configuration',
          'Ansible Playbook',
          'Ansible Requirements',
          'Ansible Rulebook',
          'Ansible Tasks File',
          'Ansible Vars File',
          'Ansible-lint Configuration',
          -- others
          'Taskfile config',
        },
      },
    },
  },
}

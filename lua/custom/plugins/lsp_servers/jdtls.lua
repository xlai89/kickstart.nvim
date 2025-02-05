-- use java installed by nix as suggested in README of nvim-java/nvim-java
-- https://github.com/nvim-java/nvim-java/blob/04e3a41afce7357ad7c8d9c6676f0f3b5f5634e6/README.md#method-2
return {
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = 'JavaSE-21',
            -- TODO: may have to updated regularly ?
            path = '/nix/store/1frnfh27i5pqk9xqahrjchlwyfzqgs1y-openjdk-21.0.5+11/lib/openjdk',
            default = true,
          },
        },
      },
    },
  },
}

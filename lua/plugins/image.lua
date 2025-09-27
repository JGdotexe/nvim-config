return {
  "3rd/image.nvim",
  opts = {
    backend = 'kitty', -- ou 'ueberzug' se você não usa um terminal compatível com o Kitty
    integrations = {
      markdown = {
        markdown_wikilink = true,
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false, -- Mude para true se preferir renderizar apenas a imagem sob o cursor
      },
    },
  },
}

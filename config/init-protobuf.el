
(defconst protobuf-style
  '((c-basic-offset . 2)
    (indent-tabs-mode . nil)))

(use-package protobuf-mode
  :hook
  (protobuf-mode . (lambda ()
		     (c-add-style "my-style" protobuf-style t)
		     (olivetti-mode))))

(provide 'init-protobuf)

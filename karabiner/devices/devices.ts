export const devices: any = [
  {
    disable_built_in_keyboard_if_exists: false,
    fn_function_keys: [],
    identifiers: {
      is_keyboard: true,
      is_pointing_device: false,
      product_id: 0,
      vendor_id: 0,
    },
    ignore: false,
    manipulate_caps_lock_led: true,
    simple_modifications: [],
    treat_as_built_in_keyboard: false,
  },
  {
    disable_built_in_keyboard_if_exists: false,
    fn_function_keys: [],
    identifiers: {
      is_keyboard: false,
      is_pointing_device: true,
      product_id: 0,
      vendor_id: 0,
    },
    ignore: true,
    manipulate_caps_lock_led: false,
    simple_modifications: [],
    treat_as_built_in_keyboard: false,
  },
  {
    disable_built_in_keyboard_if_exists: false,
    fn_function_keys: [],
    identifiers: {
      is_keyboard: true,
      is_pointing_device: true,
      product_id: 591,
      vendor_id: 1452,
    },
    ignore: true,
    manipulate_caps_lock_led: true,
    simple_modifications: [],
    treat_as_built_in_keyboard: false,
  },
  {
    disable_built_in_keyboard_if_exists: false,
    fn_function_keys: [],
    identifiers: {
      is_keyboard: true,
      is_pointing_device: false,
      product_id: 591,
      vendor_id: 1452,
    },
    ignore: false,
    manipulate_caps_lock_led: true,
    simple_modifications: [
      {
        from: {
          apple_vendor_top_case_key_code: "keyboard_fn",
        },
        to: [
          {
            key_code: "right_option",
          },
        ],
      },
    ],
    treat_as_built_in_keyboard: false,
  },
  {
    disable_built_in_keyboard_if_exists: false,
    fn_function_keys: [],
    identifiers: {
      is_keyboard: true,
      is_pointing_device: true,
      product_id: 45080,
      vendor_id: 1133,
    },
    ignore: true,
    manipulate_caps_lock_led: true,
    simple_modifications: [],
    treat_as_built_in_keyboard: false,
  },
];

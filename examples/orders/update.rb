order = Mollie::Order.update(
  'ord_kEn1PlbGa',
  billingAddress: {
    city: 'Amsterdam',
    country: 'NL',
    email: 'piet@mondriaan.com',
    familyName: 'Mondriaan',
    givenName: 'Piet',
    phone: '+31208202070',
    postalCode: '1234AB',
    region: 'Noord-Holland',
    streetAndNumber: 'Keizersgracht 313',
    title: 'Dhr'
  }
)

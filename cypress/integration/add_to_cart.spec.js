describe("Add to cart", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("can click the 'Add to Cart' button for a product on the home page and in doing so their cart increases by one", () => {
    const initialCartCount = 0;
    cy.get(".products article .btn")
      .contains("Add")
      .first()
      .click({ force: true });

    cy.get("a.nav-link")
      .contains("My Cart")
      .invoke("text")
      .then((text) => {
        const countAfterAdding = Number(text.replace(/[^0-9]/g, ""));

        // Assert the increase in cart count
        expect(countAfterAdding).to.eq(initialCartCount + 1);
      });
  });
});

class InventoryPage {
    constants = {
        INVENTORY_URL: 'https://www.saucedemo.com/inventory.html',
    };

    elements = {
        inventoryItem: () => cy.get('.inventory_item')
    };

    getInventoryItem() {
        cy.log('Getting inventory item');
        return this.elements.inventoryItem();
    }

}

export const inventoryPage = new InventoryPage();
import { LightningElement } from 'lwc';
import assignAsset from '@salesforce/apex/AssetController.assignAsset';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AssetAssignment extends LightningElement {

    employeeId = '';
    assetId = '';
    assignedDate = '';
    expectedReturnDate = '';

    handleEmployee(event) {
        this.employeeId = event.target.value;
    }

    handleAsset(event) {
        this.assetId = event.target.value;
    }

    handleAssignedDate(event) {
        this.assignedDate = event.target.value;
    }

    handleReturnDate(event) {
        this.expectedReturnDate = event.target.value;
    }

    handleSubmit() {

        assignAsset({

            employeeId: this.employeeId,
            assetId: this.assetId,
            assignedDate: this.assignedDate,
            expectedReturnDate: this.expectedReturnDate

        })

        .then(result => {

            this.dispatchEvent(

                new ShowToastEvent({

                    title: 'Success',
                    message: 'Asset Assigned Successfully',
                    variant: 'success'

                })

            );

        })

        .catch(error => {

            this.dispatchEvent(

                new ShowToastEvent({

                    title: 'Error',
                    message: error.body.message,
                    variant: 'error'

                })

            );

        });

    }

}
/* eslint-disable max-len */
/* eslint-disable indent */
/* eslint-disable indent, object-curly-spacing */
/* eslint-disable require-jsdoc */
/* eslint-disable quotes */
/* eslint-disable eol-last */

const ALGOLIA_APP_ID = 'A8ZSH6H4WN';
const ALGOLIA_ADMIN_KEY = 'deccda5b1c9c370107b978ec8e7f63db';
const ALGOLIA_DEPARTMENTS_INDEX = 'departments';

const admin = require("firebase-admin");
const { onCall } = require("firebase-functions/v2/https");
const { onDocumentCreated, onDocumentUpdated, onDocumentDeleted } = require("firebase-functions/v2/firestore");
const { algoliasearch } = require("algoliasearch");

admin.initializeApp();

const client = algoliasearch(ALGOLIA_APP_ID, ALGOLIA_ADMIN_KEY);

exports.createUser = onCall({region: "europe-west3"},
    async (request) => {
      try {
        const payload = request.data;
        const email = payload.email;
        const password = payload.password;
        const isAdmin = payload.admin || true;

        console.log("Payload:", payload);
        console.log("Received email:", email);
        console.log("Received password:", password);
        const user = await admin.auth().createUser({
          email: email,
          password: password,
        });
        await admin.auth().setCustomUserClaims(user.uid, {admin: isAdmin});
        return {uid: user.uid};
      } catch (error) {
        console.log("error deleting user", error);
      }
    });


// 📌 On Create
exports.onDepartmentCreated = onDocumentCreated({
  region: "europe-west3",
  document: 'companies/{companyId}/departments/{departmentId}',
  }, async (event) => {
    const data = event.data.data();
    const objectID = data.id;
    const companyId = event.params.companyId;

    try {
    await client.saveObject({
      indexName: ALGOLIA_DEPARTMENTS_INDEX,
      body: {
        objectID,
        ...data,
        companyId,
      },
    });
      console.log(`✅ Created: ${objectID} added to Algolia`);
    } catch (error) {
      console.error(`❌ Error adding ${objectID} to Algolia`, error);
    }
  },
);

// 📌 On Update
exports.onDepartmentUpdated = onDocumentUpdated({
  region: "europe-west3",
  document: 'companies/{companyId}/departments/{departmentId}',
}, async (event) => {
  const newData = event.data.after.data();
  const objectID = newData.id;
  const companyId = event.params.companyId;

  try {
    await client.saveObject({
      indexName: ALGOLIA_DEPARTMENTS_INDEX,
      body: {
        objectID,
        ...newData,
        companyId,
      },
    });
    console.log(`✅ Updated: ${objectID} updated in Algolia`);
  } catch (error) {
    console.error(`❌ Error updating ${objectID} in Algolia`, error);
  }
});

// 📌 On Delete
exports.onDepartmentDeleted = onDocumentDeleted({
  region: "europe-west3",
  document: 'companies/{companyId}/departments/{departmentId}',
}, async (event) => {
  // Assuming the objectID is stored in the deleted document data
  const oldData = event.data.data();
  const objectID = oldData.id;

  try {
    await client.deleteObject({
      indexName: ALGOLIA_DEPARTMENTS_INDEX,
      objectID,
    });
    console.log(`✅ Deleted: ${objectID} removed from Algolia`);
  } catch (error) {
    console.error(`❌ Error deleting ${objectID} from Algolia`, error);
  }
});
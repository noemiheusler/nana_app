import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('user_address');
  if (addressInput) {
    places({ container: addressInput });
  }

  const addressInputEvent = document.getElementById('event_location');
  if (addressInputEvent) {
    places({ container: addressInputEvent });
  }
};

export { initAutocomplete };

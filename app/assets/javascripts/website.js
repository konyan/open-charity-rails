$(document).on("ready", function () {

  OmiseCard.attach();

  $("#donate").submit(function () {

    var form = $(this);

    // Ensure that the token field is empty first.
    form.find("[name=omise_token]").val(null);

    // Disable the submit button to avoid repeated click.
    form.find("input[type=submit]").prop("disabled", true);


    const amount = form.find("[name=amount]").val();
    console.log("AMOUNT", amount);

    OmiseCard.open({
      amount: amount * 100,
      publicKey: 'pkey_test_5k804uo63k2jc8sdwk3',
      frameLabel: 'Nyan Lin Tun',
      submitLabel: 'DONATE NOW',
      submitFormTarget: '#donate',
      onCreateTokenSuccess: (nonce) => {
        /* Handler on token or source creation.  Use this to submit form or send ajax request to server */
        console.log("NONO", nonce);
        form.find("[name=omise_token]").val(nonce);
        // And submit the form.
        form.get(0).submit();
      },
      onFormClosed: () => {
        console.log("CLOSED");
        form.find("input[type=submit]").prop("disabled", false);

        /* Handler on form closure. */
      },
    });

    // // Prevent the form from being submitted;
    return false;

  });

});

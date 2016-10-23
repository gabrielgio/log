from django import forms
from django.contrib.auth.models import User


class UserRegister(forms.Form):
    email = forms.CharField(required=True)
    name = forms.CharField(required=True)
    password = forms.CharField(required=True)

    def is_valid(self):
        valid = True
        if not super(UserRegister, self).is_valid():
            self.add_error('', 'Please, double check your information.')
            valid = False

        user_existis = User.objects.filter(username=self.data['name']).exists()

        if user_existis:
            self.add_error('id_name', 'Username already exists.')
            valid = False

        user_existis = User.objects.filter(email=self.data['email']).exists()

        if user_existis:
            self.add_error('id_email', 'Email already exists.')
            valid = False

        return valid

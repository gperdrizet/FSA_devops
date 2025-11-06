---
layout: page
title: Datasets
permalink: /datasets/
---

{% for unit in site.data.datasets.units %}

## {{ unit.name }}

<table>
    <thead>
    <tr>
        <th>Lesson</th>
        <th>Assignment</th>
        <th>Dataset</th>
        <th>GitHub</th>
        <th>Download</th>
    </tr>
    </thead>
    <tbody>
    {% for lesson in unit.lessons %}
        {% for dataset in lesson.datasets %}
        <tr>
            {% if forloop.first %}
            <td rowspan="{{ lesson.datasets.size }}">{{ lesson.number }}: {{ lesson.title }}</td>
            <td rowspan="{{ lesson.datasets.size }}">{{ lesson.assignment }}</td>
            {% endif %}
            <td>{{ dataset.name }}</td>
            <td style="text-align: center;">
                {% if dataset.github %}
                <a href="{{ dataset.github }}" target="_blank">
                    <img src="https://raw.githubusercontent.com/FortAwesome/Font-Awesome/refs/heads/6.x/svgs/brands/github.svg" width="15" height="15">
                </a>
                {% else %}
                <a href="https://github.com/gperdrizet/FSA_devops/blob/main/data/unit{{ unit.number }}/{{ dataset.file }}" target="_blank">
                    <img src="https://raw.githubusercontent.com/FortAwesome/Font-Awesome/refs/heads/6.x/svgs/brands/github.svg" width="15" height="15">
                </a>
                {% endif %}
            </td>
            <td style="text-align: center;">
                <a href="https://gperdrizet.github.io/FSA_devops/assets/data/unit{{ unit.number }}/{{ dataset.file }}" download>
                    <img src="https://raw.githubusercontent.com/FortAwesome/Font-Awesome/refs/heads/6.x/svgs/solid/download.svg" width="15" height="15">
                </a>
            </td>
        </tr>
        {% endfor %}
    {% endfor %}
    </tbody>
</table>

{% endfor %}

---
layout: page
title: Jupyter notebooks
permalink: /notebooks/
---

{% for unit in site.data.notebooks.units %}

## {{ unit.name }}

<table>
    <thead>
    <tr>
        <th>Lesson</th>
        <th>Topics</th>
        <th>Notebook</th>
        <th>GitHub</th>
        <th>Download</th>
    </tr>
    </thead>
    <tbody>
    {% for lesson in unit.lessons %}
        {% for notebook in lesson.notebooks %}
        <tr>
            {% if forloop.first %}
            <td rowspan="{{ lesson.notebooks.size }}">{{ lesson.number }}: {{ lesson.title }}</td>
            <td rowspan="{{ lesson.notebooks.size }}">{{ lesson.topics }}</td>
            {% endif %}
            <td>{{ notebook.name }}</td>
            <td style="text-align: center;">
                {% if notebook.github %}
                <a href="{{ notebook.github }}" target="_blank">
                    <img src="https://raw.githubusercontent.com/FortAwesome/Font-Awesome/refs/heads/6.x/svgs/brands/github.svg" width="15" height="15">
                </a>
                {% else %}
                <a href="https://github.com/gperdrizet/FSA_devops/blob/{{ site.github_branch }}/notebooks/unit{{ unit.number }}/lesson_{{ lesson.number }}/{{ notebook.file }}" target="_blank">
                    <img src="https://raw.githubusercontent.com/FortAwesome/Font-Awesome/refs/heads/6.x/svgs/brands/github.svg" width="15" height="15">
                </a>
                {% endif %}
            </td>
            <td style="text-align: center;">
                <a href="{{ '/assets/notebooks/unit' | append: unit.number | append: '/lesson_' | append: lesson.number | append: '/' | append: notebook.file | relative_url }}" download>
                    <img src="https://raw.githubusercontent.com/FortAwesome/Font-Awesome/refs/heads/6.x/svgs/solid/download.svg" width="15" height="15">
                </a>
            </td>
        </tr>
        {% endfor %}
    {% endfor %}
    </tbody>
</table>

{% endfor %}
